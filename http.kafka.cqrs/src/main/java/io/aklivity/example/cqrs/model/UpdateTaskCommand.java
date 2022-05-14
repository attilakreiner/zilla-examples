/*
 * Copyright 2021-2022 Aklivity. All rights reserved.
 */
package io.aklivity.example.cqrs.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
public class UpdateTaskCommand implements Command
{
    String description;
}