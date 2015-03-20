From: Steven Noonan <steven@uplinklabs.net>
Date: Fri, 20 Mar 2015 13:18:46 -0700
Subject: [Buildroot] [PATCH] package: add pacman 4.2.1
In-Reply-To: <20150320205209.2830b9bc@free-electrons.com>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
 <1426736888-29437-5-git-send-email-steven@uplinklabs.net>
 <20150320205209.2830b9bc@free-electrons.com>
Message-ID: <CAKbGBLiyLf4JgiTrgN=w8YQu5xAgYHmt0UWysRGYxhjNWJjZeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 20, 2015 at 12:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Steven Noonan,
>
> On Wed, 18 Mar 2015 20:48:07 -0700, Steven Noonan wrote:
>> This is the Arch Linux package manager.
>>
>> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
>> ---
>>  package/Config.in        |  1 +
>>  package/pacman/Config.in | 18 ++++++++++++++++++
>>  package/pacman/pacman.mk | 14 ++++++++++++++
>>  3 files changed, 33 insertions(+)
>>  create mode 100644 package/pacman/Config.in
>>  create mode 100644 package/pacman/pacman.mk
>
> In addition to the comments made by Baruch, could you also include in
> the commit log a motivation for adding this package in Buildroot?
>
> It seems a bit weird to package the package manager of another distro.
>

Why do we have RPM then? :)

If we don't want it in there I have no problem maintaining it in my own tree.
