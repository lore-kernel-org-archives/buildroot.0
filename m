From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 17:53:36 +0100
Subject: [Buildroot] [PATCH] toolchain: disable internal for blackfin
In-Reply-To: <1426610460-11691-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426610460-11691-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150317175336.1dda6f72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 17 Mar 2015 13:41:00 -0300, Gustavo Zacarias wrote:
> The internal toolchain was a "best effort" approach - we strived to make
> it build properly and all but it's mostly untested.
> Since it's got issues disable it until it's properly fixed and tested
> and leave the official ADI toolchain instead.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
