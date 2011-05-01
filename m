From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 1 May 2011 07:57:43 -0500
Subject: [Buildroot] mysql server and stack direction
In-Reply-To: <20110501074808.87796h8v1x8gb3k8@www.home.zuerker.org>
References: <20110501074808.87796h8v1x8gb3k8@www.home.zuerker.org>
Message-ID: <201105010757.45510.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun May 1 2011, Heiko Zuerker wrote:
> Hi,
> 
> I'm working on the MySQL server package (v5.1 done, v5.5 will be  
> next), but one of the issues is that it needs the "stack direction"  
> set before the compile.
> 
> Does anybody have an idea how this can be configured dynamically? I'd  
> really hate to have to make this a config option.
> 

hardcode it to down.
or
if hp-parisc then up.
But B.R. doesn't do hp-parisc, so just hardcoding it should do the job.

Note:
There might be other machines that have a stack direction of up,
but I can't think of what they might be.

Mike
