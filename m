From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jan 2014 07:44:08 +0100
Subject: [Buildroot] [PATCH 1/1] Prefer 'command -v' over 'which' (for
 portability)
In-Reply-To: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
References: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20140127074408.0481487f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bj?rn Forsman,

On Sat, 25 Jan 2014 15:11:56 +0100, Bj?rn Forsman wrote:

>   $ make
> 
>   You must install 'which' on your build machine
>   make: *** [core-dependencies] Error 1

But then, do we still need to have "which" installed? Maybe this hard
dependency is no longer necessary?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
