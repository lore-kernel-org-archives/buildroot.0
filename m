From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 3 Jul 2018 10:18:57 +0200
Subject: [Buildroot] [PATCH 1/1] qt5charts: fix license
In-Reply-To: <20180702230532.40820286@windsurf.home>
References: <20180702092137.25394-1-sebastien.szymanski@armadeus.com>
 <20180702230532.40820286@windsurf.home>
Message-ID: <dd7ffef7-2969-f6a6-440c-4c875394dccc@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 07/02/2018 11:05 PM, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for this fix!
> 
> On Mon,  2 Jul 2018 11:21:37 +0200, S?bastien Szymanski wrote:
>> qt5charts-2.1.3 (build with Qt 5.6) doesn't contain any license files so
>> remove LICENSE.GPL3 from QT5CHARTS_LICENSE_FILES when building Qt 5.6.
>>
>> Fixes:
>>  http://autobuild.buildroot.net/results/c95d34129902a0511b8d64c9d50f1ffa293b33fd
>>  http://autobuild.buildroot.net/results/b9c14ce7c2fdaa412eb6416ae12a0376aaf05770
>>  http://autobuild.buildroot.net/results/1bde69c515d9140ef0f9a5571475c2850c7b8dee
> 
> Please leave a blank line before the Signed-off-by.
> 
>> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> 
> I've applied to master, however...
> 
>> ---
>>  package/qt5/qt5charts/qt5charts.mk | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
>> index 71d0e54027..9e2e6de881 100644
>> --- a/package/qt5/qt5charts/qt5charts.mk
>> +++ b/package/qt5/qt5charts/qt5charts.mk
>> @@ -16,7 +16,9 @@ QT5CHARTS_DEPENDENCIES = qt5base
>>  QT5CHARTS_INSTALL_STAGING = YES
>>  
>>  QT5CHARTS_LICENSE = GPL-3.0
> 
> ... are we sure the license is GPL-3.0 for both versions of qt5charts ?

I wondered the same thing.

According to the Qt blog [1], Qt Charts is available under GPLv3 (and
commercial license) since Qt 5.6.0:

"As announced recently, the Qt Add-ons licensing will be changed so that
the Qt Charts module becomes available under both GPLv3 and commercial
license terms."

[1] http://blog.qt.io/blog/2016/01/18/qt-charts-2-1-0-release/

Regards,

> 
> Thanks!
> 
> Thomas
> 


-- 
S?bastien Szymanski
Software engineer, Armadeus Systems
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
