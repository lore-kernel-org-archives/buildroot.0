From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 16 Oct 2012 20:26:53 +0100
Subject: [Buildroot] [PATCH] macchanger: new package
In-Reply-To: <507DAD97.6090003@mind.be>
References: <1350412488-17233-1-git-send-email-spdawson@gmail.com>
 <507DAD97.6090003@mind.be>
Message-ID: <CAHt8ZCNDNa8vL20Zc6he4UP5rffnqaCEx9qJ98TiyZN5vMmVpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout; thanks for the feedback.

On 16 October 2012 19:55, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Just for my info, what does this do that 'ip link set address
> xx:xx:xx:xx:xx:xx'
> doesn't?

In addition to setting a specific MAC address, the tool can also be
used to set a random address. I don't think you can do that using ip.

>> +MACCHANGER_SITE = ftp://ftp.gnu.org/gnu/macchanger
>
>
> MACCHANGER_SITE = $(BR2_GNU_MIRROR)/macchanger
>
>  With this amendment:
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  (build-test with a WCHAR-only internal powerpc toolchain)

Okay; will fix this and resubmit.

Simon.
