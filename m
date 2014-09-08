From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Sep 2014 09:37:47 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140908103445.6a8858b4@free-electrons.com>
References: <20140907063013.1CB98101499@stock.ovh.net>	<20140907100918.6b017a09@free-electrons.com>	<540D69A4.4080503@imgtec.com>
 <20140908103445.6a8858b4@free-electrons.com>
Message-ID: <540D6ADB.30300@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/08/2014 09:34 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Mon, 8 Sep 2014 09:32:36 +0100, Vicente Olivert Riera wrote:
>> On 09/07/2014 09:09 AM, Thomas Petazzoni wrote:
>>>>     mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/2ab5ab179dab9e1a47092b066f97d48c75ab935b/
>>>
>>> Lots of crazy errors. Vicente?
>>
>> I reported this upstream on 23-May-2014.
>>
>> https://bugreports.qt-project.org/browse/QTBUG-39224
>
> So maybe we should simply disable the selection of QtWebkit in Qt4 for
> MIPS64 n32 ?
>
> Thomas

Well, more build logs related to this issue are useless because it's 
being handled upstream, so, yes, maybe we should disable it for MIPS64 
n32 until this problem gets fixed.

-- 
Vincent
