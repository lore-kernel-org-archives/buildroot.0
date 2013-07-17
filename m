From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Jul 2013 12:46:12 -0300
Subject: [Buildroot] Activation of pygobject
In-Reply-To: <747C1E83C744F44E9ACFB89FAEEC2C7B2423DFD2A7@EXDCVYMBSTM005.EQ1STM.local>
References: <747C1E83C744F44E9ACFB89FAEEC2C7B2423DFD2A7@EXDCVYMBSTM005.EQ1STM.local>
Message-ID: <51E6BC44.7000600@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/17/2013 10:03 AM, Julien COUVRAND wrote:

> Hi,
> 
> Trying to enable simple agent from bluez such as :
> simple-agent hci0 68:EB:AE:4F:A4:B5
> 
> I meet an error:
> ---
> Traceback (most recent call last):
>   File "/usr/bin/simple-agent", line 3, in <module>
>     import gobject
> ImportError: No module named gobject
> ---
> 
> My configuration is the following:
> - Bluez
> - Python
> - Dbus-glib
> - Dbus-python
> 
> However, on buildroot, I don't find the way to import python-gobject.
> Do you know how to import gobject?

Hi.
You're missing pygobject which isn't a package (yet) in buildroot.
Regards.
