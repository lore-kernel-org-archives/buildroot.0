From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu, 9 Feb 2017 22:53:00 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/qt5/*: add meaningful help
 texts and package URLs
In-Reply-To: <20170209222048.0a9e3c45@free-electrons.com>
References: <1486549595-15691-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1486549595-15691-3-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20170209222048.0a9e3c45@free-electrons.com>
Message-ID: <9deada82-b895-95d9-5a11-06eba47c9960@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/09/2017 10:20 PM, Thomas Petazzoni wrote:

> Hello,
>
> On Wed,  8 Feb 2017 11:26:35 +0100, Zoltan Gyarmati wrote:
>> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>> ---
>>  package/qt5/qt5canvas3d/Config.in         | 5 +++--
>>  package/qt5/qt5connectivity/Config.in     | 6 ++++--
>>  package/qt5/qt5declarative/Config.in      | 6 ++++--
>>  package/qt5/qt5enginio/Config.in          | 5 +++--
>>  package/qt5/qt5graphicaleffects/Config.in | 6 ++++--
>>  package/qt5/qt5imageformats/Config.in     | 5 +++--
>>  package/qt5/qt5location/Config.in         | 6 ++++--
>>  package/qt5/qt5multimedia/Config.in       | 7 +++++--
>>  package/qt5/qt5quickcontrols/Config.in    | 5 +++--
>>  package/qt5/qt5quickcontrols2/Config.in   | 2 +-
>>  package/qt5/qt5script/Config.in           | 5 +++--
>>  package/qt5/qt5sensors/Config.in          | 5 +++--
>>  package/qt5/qt5serialbus/Config.in        | 2 +-
>>  package/qt5/qt5serialport/Config.in       | 6 ++++--
>>  package/qt5/qt5svg/Config.in              | 5 +++--
>>  package/qt5/qt5tools/Config.in            | 5 +++--
>>  package/qt5/qt5webchannel/Config.in       | 6 ++++--
>>  package/qt5/qt5webkit/Config.in           | 6 ++++--
>>  package/qt5/qt5websockets/Config.in       | 7 +++++--
>>  package/qt5/qt5x11extras/Config.in        | 5 +++--
>>  package/qt5/qt5xmlpatterns/Config.in      | 5 +++--
>>  21 files changed, 70 insertions(+), 40 deletions(-)
> Applied to master, thanks. Since you're interested in Qt5, what about
> adding yourself for package/qt5/ in the DEVELOPERS file?
 Yes, it's fine with me, anyway I'm also testing the QtWebView build
in the upcoming days, so there are more patches coming...
>
> Also Peter (Seiderer), you are only listed for a few Qt5 modules in
> DEVELOPERS, what about using package/qt5/ instead?
>
> Both of you are using Qt5 apparently, and this is a very important
> package in Buildroot. Having more people looking after build failures
> and reviewing Qt5 patches would be good.
>
> Thanks!
>
> Thomas
Thx, regards,

Zoltan Gyarmati
https://zgyarmati.de


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170209/84cf3240/attachment.asc>
