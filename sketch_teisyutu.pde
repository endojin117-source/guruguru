int spotCntMax = 50;   // 表示する点の数
float stepCnt = 0;     // 時間の進み具合

void setup() {
  size(480, 480);                         
  colorMode(HSB, 360, 100, 100, 100);      // 色をHSB（色相・彩度・明度・透明度）で指定
  frameRate(20);                           // 1秒間に20フレーム描画
  noStroke();                             
 }

void draw() {
  background(0, 0, 0, 100);               
  translate(width/2, height/2);            // 座標の原点を画面中央に移動

  // 点を順番に描画
  for (int i = 1; i <= spotCntMax; i++) {
    float u = (float)(i-1) / (spotCntMax-1);  // 点のインデックスを0〜1に正規化

    float r = lerp(10, 200, u);     // 半径を線形補間
    float s = lerp(5.0, 0.1, u);    // 回転スピードを線形補間

    float angle = PI * s * stepCnt; // 回転角度（スピードと時間から計算）
    float x = r * cos(angle);       // X座標（極座標→デカルト座標変換）
    float y = r * sin(angle);       // Y座標

    fill(i * 5, 100, 50);           // 点の色をHSBで指定
    ellipse(x, y, 10, 10);          // 点を描画
  }

  stepCnt += 0.02;                  // 時間を進める（小さいほど動きが遅い）
}
