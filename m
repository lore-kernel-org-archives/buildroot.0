From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Jan 2018 21:04:43 +0100
Subject: [Buildroot] Migrated from 2017.08 to 2017.11, rfkill issues
In-Reply-To: <875670032.71418.1516896415562.JavaMail.zimbra@datacom.ind.br>
 (Carlos Santos's message of "Thu, 25 Jan 2018 14:06:55 -0200 (BRST)")
References: <CAPzckP5y+dLADBwJ-pY52v_oNMyfJfwf73tJk-EdDN5VqLQ6fg@mail.gmail.com>
 <87tvvakkmq.fsf@dell.be.48ers.dk>
 <875670032.71418.1516896415562.JavaMail.zimbra@datacom.ind.br>
Message-ID: <87po5xln6s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

Hi,

 >> What is your toolchain configuration? RFKILL_TYPE_FM got added to the
 >> kernel headers a long time ago (commit 875405a7793e9c35fa, during the
 >> 2.6.33 cycle), so it sounds quite odd that your toolchain doesn't know
 >> it.

 > Notice that the problem happens when compiling host-util-linux. The
 > toolchain should not be relevant in this case.

Ahh, indeed - I completely missed that.

-- 
Bye, Peter Korsgaard
