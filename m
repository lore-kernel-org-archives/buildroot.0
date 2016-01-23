From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 15:42:20 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAXf6LVEad4=FoRzHa1cE5Yop94UAAEY7n-O7GfhHYaPsF06_w@mail.gmail.com>
References: <CAAXf6LVT_WBVsRfs8JAT0DMPDhSYDhvM02CDkLFW+6RQ4JkQeg@mail.gmail.com>
 <56a38670821b1_103918cca708271f@ultri2.mail>
 <CAAXf6LVEad4=FoRzHa1cE5Yop94UAAEY7n-O7GfhHYaPsF06_w@mail.gmail.com>
Message-ID: <20160123154220.06518c9d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, 23 Jan 2016 15:26:13 +0100, Thomas De Schampheleire wrote:

> I guess a hard link would work here, then. Care to try?

But why would we do that? If I understood Ricardo's e-mail, a simple
change to the patch (remove the double quotes) would make it just work.

So why are we looking for a complicated solution here ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
