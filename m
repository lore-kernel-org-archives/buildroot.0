From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Apr 2014 14:09:00 +0200
Subject: [Buildroot] mail list details
In-Reply-To: <5e9a4c7fa18c7e6418033c8468ac0679@paravisioner.com>
References: <5e9a4c7fa18c7e6418033c8468ac0679@paravisioner.com>
Message-ID: <CAAXf6LUX2p1DnyZjyzZhJE1DjnRX9oeSDTP03h8t27EY30gMpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


On Tue, Apr 29, 2014 at 1:44 PM, Parsa Panahi
<panahi.parsa@paravisioner.com> wrote:
> Hi I want to become familiar with buildroot daily mails which comes to me
> everyday.
>
> I receive many emails in this format that is changing some packages with
> some config file. for example the following is about a change to opencv
> package to support qt5.. but I don't know how to apply it to my config file,
> so it become updated ...
>
>

What is sent on the list are 'patches'. A patch is a set of lines
representing a change to the code. See also
http://en.wikipedia.org/wiki/Patch_%28Unix%29

The typical way to start is to use a git repository and clone the
buildroot sources. Patches can then be applied using 'git am', or
using the standard 'patch' utility (git is recommended).
See http://nightly.buildroot.org/manual.html#getting-buildroot and
http://nightly.buildroot.org/manual.html#apply-patches-patchwork for
some details.

Best regards,
Thomas
