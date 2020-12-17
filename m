From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 17 Dec 2020 10:27:42 -0300
Subject: [Buildroot] Fwd: Less Restrictive attribute error on
 init_module and cleanup_module
In-Reply-To: <CAGshWo20BfGQMhgwQs9L9qFdtDSbHFGi=N33bSC586x1+OJmNA@mail.gmail.com>
References: <CAGshWo14F9x8-OzHXCpep7roX49G9AesBUyC3ppzSTUwAvzmHw@mail.gmail.com>
 <CAGshWo20BfGQMhgwQs9L9qFdtDSbHFGi=N33bSC586x1+OJmNA@mail.gmail.com>
Message-ID: <CAOMZO5BsMA_wgUYtG3LjAZ87_9b1uLgL-_PPatAGry910+7nnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Manu,

On Thu, Dec 17, 2020 at 9:32 AM manu f <e.fiancette@gmail.com> wrote:
>
>
> Hello all, I am Manu from France.
>
> Actually I try to compile buidroot 2020.8 on ubuntu 20.04LTS for imx6 target with internal toolchain arm 2019.12

Why don't you use the default toolchain that is selected by Buildroot instead?

What kernel version are you trying to build?

There are many imx6 targets supported in Buildroot. You can run "ls
configs/*mx6*" to get references of existing supported imx6 targets.

I suggest you to use one of these targets as a reference for
generating your own defconfig.

Regards,

Fabio Estevam
