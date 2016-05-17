From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 17 May 2016 09:35:58 +0200
Subject: [Buildroot] [PATCH 1/2] python-flask-jsonrpc: new package
In-Reply-To: <20160513223526.50f5264d@free-electrons.com>
References: <1462975669-18032-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20160513223526.50f5264d@free-electrons.com>
Message-ID: <e98205ca-9b8e-d464-5566-a208d158f086@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 05/13/2016 10:35 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 11 May 2016 16:07:48 +0200, S?bastien Szymanski wrote:
>> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
>> ---
>>  package/Config.in                                      |  1 +
>>  package/python-flask-jsonrpc/Config.in                 |  7 +++++++
>>  package/python-flask-jsonrpc/python-flask-jsonrpc.hash |  3 +++
>>  package/python-flask-jsonrpc/python-flask-jsonrpc.mk   | 14 ++++++++++++++
>>  4 files changed, 25 insertions(+)
>>  create mode 100644 package/python-flask-jsonrpc/Config.in
>>  create mode 100644 package/python-flask-jsonrpc/python-flask-jsonrpc.hash
>>  create mode 100644 package/python-flask-jsonrpc/python-flask-jsonrpc.mk
> 
> I've applied to next, after doing the following changes:
> 
>     [Thomas:
>      - make python-flask a runtime dependency only, as noticed by Yegor
>        Yefremov.
>      - use setup.py as the license file.]
> 
> Thanks for the contribution, and thanks Yegor for the review!
> 
> Thomas
> 

FYI, I've sent an e-mail to the maintainer, as suggested by Yegor, but
he didn't answer me.
Anyway, thank you !

-- 
S?bastien Szymanski
Software Engineer
Armadeus Systems - A new vision of the embedded world
sebastien.szymanski at armadeus.com
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
