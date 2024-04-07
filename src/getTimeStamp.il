;--------------------------
; Program  : virtuoso-design-hierarchy(getTimeStamp.il)
; Language : Cadence Skill
; Author   : YEUNGCHIE
;--------------------------
useNamespace("ycDesignHier")

procedure(getTimeStamp()
    let((tm)
        tm = timeToTm(stringToTime(getCurrentTime()))
        lsprintf("%02d-%02d-%02d %02d:%02d:%02d"
            tm~>tm_year+1900
            tm~>tm_mon+1
            tm~>tm_mday
            tm~>tm_hour
            tm~>tm_min
            tm~>tm_sec
        )
    )
)

unuseNamespace("ycDesignHier")
; END
