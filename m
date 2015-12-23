From: Julien CORJON <corjon.j@ecagroup.com>
Date: Wed, 23 Dec 2015 19:46:57 +0000
Subject: [Buildroot] [PATCH v2] qt5/qt5webchannel: add qwebchannel.js
 installation in /var/www
In-Reply-To: <20151223184215.GE3426@free.fr>
References: <1450890245-16195-1-git-send-email-corjon.j@ecagroup.com>
 <20151223182401.GA3426@free.fr>
 <d117a580-8ae1-4711-b455-9a7ec4e2f932@MAIL-SINTERS-01.sinters-int.fr>
 <20151223184215.GE3426@free.fr>
Message-ID: <d35408dc-e454-445a-b2fa-04ea3fae7068@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Le 23/12/2015 19:42, Yann E. MORIN a ?crit :
> Julien, All,
>
> On 2015-12-23 18:34 +0000, Julien CORJON spake thusly:
>> Le 23/12/2015 19:24, Yann E. MORIN a ?crit :
>>> On 2015-12-23 18:04 +0100, Julien Corjon spake thusly:
>>>> To use webchannel in an application qwebchannel.js is needed but this file was not
>>>> installed.
>>>>
>>>> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
>>>
>>> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>>
>>> However, I was having a look at our current package, and there's
>>> something really odd that struck me. If the Qt5base examples are
>>> enabled, then we define QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES but we
>>> never use it.
>>
>> I also notice this issue yesterday but I also notice that most of the qt
>> modules (except qt5base) compile examples but don't install them in
>> staging and target. Only the sources files are installed.
>>
>> I would like fix the examples binary install of all the Qt modules and
>> in the mean time fix the qwebchannel examples installation.
>
> OK, be my guest then! ;-)
>
> However, before you actually work on it, I'd like our Qt5 experts chime
> in and validate that something is to be fixed (may there's some
> underlying reason not to install them)...

I cannot point any reason to have the source on the target (but no qmake 
and gcc to compile them) and no binaries...

If I want to try Qt examples I want to have only the binaries on the 
target and I can take a look on the sources on my host not the opposite ;)

Regards,
Julien
