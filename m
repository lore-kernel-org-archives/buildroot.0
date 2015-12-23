From: Julien CORJON <corjon.j@ecagroup.com>
Date: Wed, 23 Dec 2015 16:24:20 +0000
Subject: [Buildroot] [PATCH 1/1] qt5/qt5webchannel: add qwebchannel.js
 installation choice
In-Reply-To: <20151223170231.1754085d@free-electrons.com>
References: <1450872768-27153-1-git-send-email-corjon.j@ecagroup.com>
 <20151223170231.1754085d@free-electrons.com>
Message-ID: <eef8db72-7643-4c20-8dd4-f24d61dbb50d@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Le 23/12/2015 17:02, Thomas Petazzoni a ?crit :
> Dear Julien Corjon,
>
> On Wed, 23 Dec 2015 13:12:48 +0100, Julien Corjon wrote:
>> To use webchannel in an application qwebchannel.js is needed but this file is not
>> installed. Add an option to fix that and let the user choose the location.
>>
>> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
>
> It is not very usual to be able to customize the path where packages
> install stuff. Can we fine a default sane location to install this
> qwebchannel.js, and just install it there?

I should be agree with this, but in that case the javascript file should 
be installed in a website hosting path. For my application this one is 
in /usr/local/myApp/www for others it can be in an apache, lighttpd, 
monkey, etc directory.

I'm not a web hosting expert, so if there is an generic path for that we 
can remove that customisation and let the specific applications make a 
symbolic link if they don't comply with the generic path.

Regards,

Julien

>
> Thanks,
>
> Thomas
>
