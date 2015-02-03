From: Steve Kenton <skenton@ou.edu>
Date: Mon, 02 Feb 2015 23:16:08 -0600
Subject: [Buildroot] Grub2 and Memtest86+
In-Reply-To: <54D0588E.2070301@ou.edu>
References: <54CA4C59.3010107@ou.edu>
 <20150129165054.5b72b7fe@free-electrons.com> <54D0588E.2070301@ou.edu>
Message-ID: <54D05998.9000705@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/02/2015 11:11 PM, Steve Kenton wrote:
>>
> In my experimenting with grub2 it looks like it is leaking in host information.
> Here is a fragment from grub-install which is installed in ~host/usr/sbin.
> 
> When it tries to run other scripts like grub-mkimage it looks in /usr
> because of the prefix. At least when the host versions were not reachble
I should say Ubuntu build host versions were not reachable to be clear

Steve
> I got an error about command not found. Does grub2 need to be configured with
> a prefix other than /usr since it's run on the host and not the target?
> 
