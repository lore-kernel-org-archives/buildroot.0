From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Mon, 14 Oct 2013 17:23:46 +0200
Subject: [Buildroot] Help with selecting package
In-Reply-To: <CAAXf6LXB8+5bjhZ3Y0ftNR0aQVK8Rvge_YDq-KvhfpORO8LPMw@mail.gmail.com>
References: <525BAB59.4020105@gmail.com>	<20131014114754.12f56017@skate>	<525BCC9C.9020602@gmail.com>	<20131014134753.33a41074@skate>	<525BED56.5030704@gmail.com>
 <CAAXf6LXB8+5bjhZ3Y0ftNR0aQVK8Rvge_YDq-KvhfpORO8LPMw@mail.gmail.com>
Message-ID: <525C0C82.6090801@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 14/10/2013 16:02, Thomas De Schampheleire ha scritto:
> The best way in this case is to open the linux-menuconfig, type / 
> (slash) followed by a search string, for example VIDEOBUF_GEN. It 
> should show you at least one match, along with more details about: - 
> where is it in the menu structure - which options does it depend on 
> (and what is the current value of these options, indicated with [=y], 
> [=n] etc. This should give you enough info to be able to select the 
> option correctly.


Done!
It compiled successfully without any warning.
However on the target it shows again some errors when trying to load:

s2253: no symbol version for videobuf_streamoff
s2253: Unknown symbol for videobuf_streamoff (err -22)
.
.

Because they relies upon the same VIDEOBUF_GEN I bet there was something 
else to configure, a part the option in the kernel config.

Thanks for your patience!
Mark
