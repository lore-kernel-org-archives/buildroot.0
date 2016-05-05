From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 5 May 2016 10:07:41 -0300
Subject: [Buildroot] [PATCH 2/2] configs/qemu: bump to the latest version
In-Reply-To: <20160505130537.GX26720@waldemar-brodkorb.de>
References: <1462447857-29400-1-git-send-email-gustavo@zacarias.com.ar>
 <1462447857-29400-2-git-send-email-gustavo@zacarias.com.ar>
 <20160505130537.GX26720@waldemar-brodkorb.de>
Message-ID: <572B459D.8060304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/05/16 10:05, Waldemar Brodkorb wrote:

>> (3) - It boots, you can login, but apps exit/crash often
>
> What kind of crashes do you see? Can you tell me the applications?
>
> Thanks for the nice overview.

Hi Waldemar.
uname -a will quick you out (logout).
ps will do as well.
Seems that anything that's run will throw the parent shell down.
Regards.
