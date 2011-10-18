From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Oct 2011 15:01:14 -0300
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <20111018192708.68b1ba88@skate>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
 <20111018163202.504d5069@skate> <201110181055.22743.minimod@morethan.org>
 <6f1dea83ae8cd19b1f8304fee05d45d4@zacarias.com.ar>
 <20111018192708.68b1ba88@skate>
Message-ID: <bd3650393bb885ae632b4e1963278d3f@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18.10.2011 14:27, Thomas Petazzoni wrote:

> Le Tue, 18 Oct 2011 13:00:28 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
>
>> Also contemplating how to properly do PKG_SIZE (for file size) and
>> PKG_HASH (MD5 and/or SHA1) for source consistency.
>
> Do we actually want that ? I know OE does this, but tarball size and
> hashes will be a pain to keep updated.
>
> Thomas

In a non-mandatory way it may be desirable.
That is if a package doesn't define it then we don't care.
Most of the time tarballs shouldn't change size & hash, though it 
doesn't hold true for every project around.
It could also be an option to completely disable it.
Regards.
