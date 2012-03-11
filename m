From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 19:35:49 -0300
Subject: [Buildroot] [PATCH 06/20] usbutils: bump version to 005
In-Reply-To: <87k42qyegy.fsf@macbook.be.48ers.dk>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
 <1331502489-5036-6-git-send-email-gustavo@zacarias.com.ar>
 <87k42qyegy.fsf@macbook.be.48ers.dk>
Message-ID: <f024c8c90730d6412e5c2bfcca176cad@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-11 19:12, Peter Korsgaard wrote:

>  Gustavo> +USBUTILS_AUTORECONF = YES
>
> Why do we need to autoreconf? We don't have any patches.

Tarball isn't autoconf'ed, probably since it's pulled from git rather 
than packaged.
Regards.
