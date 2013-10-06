From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 23:22:40 +0200
Subject: [Buildroot] [PATCH] docs/manual: add a 'Known issues' chapter
In-Reply-To: <87r4byfdql.fsf@dell.be.48ers.dk>
References: <1381081747-20598-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87r4byfdql.fsf@dell.be.48ers.dk>
Message-ID: <20131006232240.3c8923c0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 06 Oct 2013 20:36:34 +0200, Peter Korsgaard wrote:

>  Thomas> +* The +prboom+ package triggers a compiler failure with the SuperH 4
>  Thomas> +  compiler from Soucery CodeBench, version 2012.09.
> 
> I believe we have a lot of other situations with packages triggering
> internal compiler errors, especially for microblaze and avr32.

I agree, but I'm merely documenting the exceptions I've added in my
autobuilders script. I'm planning on adding similar exceptions and
documentation in this "Known issues" section for the other compiler
failures as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
