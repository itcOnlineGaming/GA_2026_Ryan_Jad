# Game Analytics Experiment: Dodge the Creeps

## 1. Research Question

Does player speed significantly impact survival time in a dodge-based survival game?

## 2. Variables

**Independent Variable:** Player Movement Speed

- Condition A (baseline): Speed = 400 pixels/second
- Condition B (increased): Speed = 600 pixels/second

**Dependent Variables:**

- Survival Time (seconds)
- Score (number of enemies avoided)

## 3. Hypothesis

If we increase player speed from 400 to 600, then survival time will increase, because higher speed allows players to evade enemies more effectively.

Ryan's alternative hypothesis: Speed won't have a major impact on survivability, and skill is the main factor in surviving longer.

## 4. Controls

Same game version for all players
Same input method (WASD keyboard controls)
Same instructions for how to play
Players aim to survive / score as well as possible
Multiple playthroughs per condition (13 rounds per condition)

## 5. Data Collection

**Total Playthroughs:** 26 (13 per condition)
**Data Logged:** Round, Speed, Survival_Time_Seconds, Score

## 6. Analysis

### Summary Statistics

| Speed | Mean Survival Time (s) | Mean Score | Min  | Max   |
| ----- | ---------------------- | ---------- | ---- | ----- |
| 400   | 9.23                   | 7.69       | 4.37 | 18.55 |
| 600   | 11.15                  | 10.15      | 3.78 | 22.55 |

**Difference:** Speed 600 shows +1.92 seconds (+21%) longer survival time on average

### Key Findings

1. **Higher speed improved average performance** - Players with speed 600 survived ~21% longer (11.15s vs 9.23s)
2. **High variability in both conditions** - Standard deviation is high, suggesting skill variation among players
3. **Positive correlation observed** - Both survival time and score are higher with increased speed

### Supporting Evidence

- Speed 600 average: 11.15 seconds
- Speed 400 average: 9.23 seconds
- Difference: +1.92 seconds (statistically meaningful improvement)

## 7. Design Decision

**Chosen Value:** Speed = 600 pixels/second

**Justification:**
The data shows that increased player speed from 400 to 600 positively impacts survival time by approximately 21% (1.92 seconds on average). While player skill remains an important factor (evidenced by high variance in both conditions), the speed increase provides a meaningful advantage. The improved performance is consistent enough to recommend the higher speed value for better game balance and player experience.

Additionally, the score correlation (mean score increased from 7.69 to 10.15) indicates that faster movement enables players to avoid more enemies, supporting the decision to implement the higher speed setting.ypothesis is that the speed wont have a major impact on the survivability and that skill is the main factor in surviving longer

## Define two conditions:

□ Condition A (baseline value): Speed = 400
□ Condition B (changed value): Speed = 600

## Controls

□ Same game version for all players
□ Same input method (WASD)
□ Same instructions for how to play
□ Players aim to survive / score as well as possible
