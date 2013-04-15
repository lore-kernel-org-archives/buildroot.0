From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 15 Apr 2013 09:40:39 +0100
Subject: [Buildroot] [PATCH] sam-ba: add license information
In-Reply-To: <20130415103252.26d79960@skate>
References: <1366010340-10833-1-git-send-email-spdawson@gmail.com>
 <20130415103252.26d79960@skate>
Message-ID: <CAHt8ZCM50Px59NfArH=xeOeGH1mvnmtN7tS8m01Euv5rQo87oQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, thanks for looking at this.

On 15 April 2013 09:32, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Simon,
>
> On Mon, 15 Apr 2013 08:19:00 +0100, spdawson at gmail.com wrote:
>
>> +SAM_BA_LICENSE = BSD-like
>> +SAM_BA_LICENSE_FILES = doc/readme.txt
>
> Hum, is this really the case? I thought the source code for it was not
> available? Well, it's true that a binary-only program can carry a BSD
> license... but to me, having 'BSD-like' license on a binary-only
> program sounds a bit odd.

Yes, agreed. I'm not sure what the right approach is, given that
sam-ba as distributed is a mixture of pre-built binaries, and (C and
Tcl) source code. Perhaps we just say "sam-ba license", which may be
less contentious...?

I'm pasting the contents of the doc/readme.txt file below for your information.

Simon.

/* ----------------------------------------------------------------------------
 *         ATMEL Microcontroller Software Support
 * ----------------------------------------------------------------------------
 * Copyright (c) 2012, Atmel Corporation
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the disclaimer below.
 *
 * Atmel's name may not be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
 * DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * ----------------------------------------------------------------------------
 */
