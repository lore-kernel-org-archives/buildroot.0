From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:45:21 +1300
Subject: [Buildroot] [PATCH 1/2] efl: fix target package dependency on
 util-linux (libmount).
In-Reply-To: <f3f89ca1-087c-239c-5e01-c47cab50e3b3@gmail.com>
References: <20170103212932.9254-1-barbieri@profusion.mobi>
 <20170103212932.9254-2-barbieri@profusion.mobi>
 <3b511a0a-99aa-23d3-0649-08c725fa9eea@gmail.com>
 <CAPdpN3CmdooHnHHHvmMguW6dBqsN+CksS6r2OUWCmRWPBvkZyg@mail.gmail.com>
 <f3f89ca1-087c-239c-5e01-c47cab50e3b3@gmail.com>
Message-ID: <20170128214521.21067f36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 6 Jan 2017 00:20:55 +0100, Romain Naour wrote:
> > sounds good. Following that guideline I should add myself to that
> > file, likely in this patch. Okay?  
> 
> Well, It seems that the recommended way to do it is to send a separate patch.
> The reason is: if someone need to backport a patch adding a feature or a new
> package, we want to avoid a conflict in DEVELOPERS file while cherry-picking the
> commit.
> 
> Thomas, can you confirm ?

Correct. Please send a separate patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
