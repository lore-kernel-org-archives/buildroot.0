From: Anton Leontiev <scileont@gmail.com>
Date: Wed, 28 Apr 2021 07:39:10 +0300
Subject: [Buildroot] [PATCH] docs/manual: document KBUILD_VERBOSE
 environment variable
In-Reply-To: <20210427195118.GA2137340@scaer>
References: <20210419160346.6393-1-scileont@gmail.com>
 <20210427195118.GA2137340@scaer>
Message-ID: <CAPbbKZbyv=myTw1huROwV9MnGB4gSuKuq5NBS6tv4M+oT09oJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN <yann.morin.1998@free.fr>:

> The naming of the KBUILD_VERBOSE variable is just an implementation
> detail. That it has a similar purpose as a variable of the same name in
> Kbuild (the linux kernel buildsystem) is just happenstance.
>
> Buildroot is not using Kbuild, nor is it even remotely based on Kbuild.
>
> After discussing among maintainers, we decided that we did not want to
> officially expose that variable.
>

Then maybe it's better to rename this variable into something like
BR2_VERBOSE?

-- 
Anton Leontiev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210428/4144b0bc/attachment.html>
