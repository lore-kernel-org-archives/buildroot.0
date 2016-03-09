From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 9 Mar 2016 13:36:31 -0300
Subject: [Buildroot] [PATCH] libglib2: improve dev file removal
In-Reply-To: <20160309173530.36363520@free-electrons.com>
References: <1457540712-19580-1-git-send-email-gustavo@zacarias.com.ar>
 <20160309173530.36363520@free-electrons.com>
Message-ID: <56E0510F.2020903@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/16 13:35, Thomas Petazzoni wrote:

> Gustavo,
>
> On Wed,  9 Mar 2016 13:25:12 -0300, Gustavo Zacarias wrote:
>> * Remove /usr/share/glib-2.0 rmdir from DEV_FILES hook, if we are not
>> using gdb the GDB_FILES hook will hit and remove it anway, and if we are
>> indeed using gdb we need it.
>
> Where is this done in your patch?

Bleh! I'll spin v2 for correctness.
Regards.
