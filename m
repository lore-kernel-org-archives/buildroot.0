From: Julien COUVRAND <julien.couvrand@stericsson.com>
Date: Thu, 18 Jul 2013 10:11:02 +0200
Subject: [Buildroot] Activation of pygobject
In-Reply-To: <51E6BC44.7000600@zacarias.com.ar>
References: <747C1E83C744F44E9ACFB89FAEEC2C7B2423DFD2A7@EXDCVYMBSTM005.EQ1STM.local>
 <51E6BC44.7000600@zacarias.com.ar>
Message-ID: <747C1E83C744F44E9ACFB89FAEEC2C7B2423DFD3DE@EXDCVYMBSTM005.EQ1STM.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Do you know when this package is available under Buidlroot?
I guess the only way to solve this issue is to import manually this package under buildroot.


Julien

Julien COUVRAND
MOPI - 8540 SWPF Object Leader
------------------------------------------------------------------------------------

Mailto:???? 11 rue Pierre-Felix Delarue
??????????????????? 72100 Le Mans -? FRANCE
Office:????? +33 2 44 02 71 07
Mobile: ?? +33 6 03 49 09 04 
Emailto :?? julien.couvrand at stericsson.com
-------------------------------------------------------------------------------------
This communication is confidential and intended solely for the addressee(s). Any unauthorized review, use, disclosure or distribution is prohibited. If you believe this message has been sent to you in error, please notify the sender by replying to this transmission and delete the message without disclosing it. Thank you.

E-mail including attachments is susceptible to data corruption, interception, unauthorized amendment, tampering and viruses, and we only send and receive emails on the basis that we are not liable for any such corruption, interception, amendment, tampering or viruses or any consequences thereof.


-----Original Message-----
From: Gustavo Zacarias [mailto:gustavo at zacarias.com.ar] 
Sent: mercredi 17 juillet 2013 17:46
To: Julien COUVRAND
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Activation of pygobject

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
