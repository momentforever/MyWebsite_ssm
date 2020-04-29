package com.tmfhome.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sarschina {
    private String mainland;
    private int cases;
    private int deaths;
    private int serious;
    private int critical;
    private int recovered;
}
