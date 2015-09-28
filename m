From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 28 Sep 2015 21:00:06 +0200
Subject: [Buildroot] [PATCH v3 2/4] pkg-generic: prevent _SITE URLs with
 a trailing slash
In-Reply-To: <20150928172749.GA2309@tarshish>
References: <1443456634-21484-1-git-send-email-luca@lucaceresoli.net>
 <1443456634-21484-3-git-send-email-luca@lucaceresoli.net>
 <20150928172749.GA2309@tarshish>
Message-ID: <56098E36.4020302@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch,

Baruch Siach wrote:
> Hi Luca,
>
> On Mon, Sep 28, 2015 at 06:10:32PM +0200, Luca Ceresoli wrote:
>> A trailing slash in FOO_SITE is useless, since Buildroot automatically adds
>> a slash between FOO_SITE and the filename as appropriate.
>>
>> Moreover they are potentially armful, which led to introducing a workaround
>
> harmful?

Of course!
Thanks for spotting it.

-- 
Luca
