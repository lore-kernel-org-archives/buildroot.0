From: Luca Ceresoli <lucaceresoli77@gmail.com>
Date: Tue, 7 Feb 2017 11:59:07 +0100
Subject: [Buildroot] LIBFOO_GIT_SUBMODULES
In-Reply-To: <20170131083011.ut2ltabpqw23v2m5@tarshish>
References: <CABLXdK9xko_SrWN1JQtSwZTxJ8PJuW=CVr6b4D4XR8RiEMXfcg@mail.gmail.com>
 <20170131083011.ut2ltabpqw23v2m5@tarshish>
Message-ID: <df4aca1a-220d-8d92-40da-a14364b37eff@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/01/2017 09:30, Baruch Siach wrote:
> Hi Ricardo,
> 
> On Tue, Jan 31, 2017 at 09:20:46AM +0100, Ricardo Herrero wrote:
>>  I?m trying to use github to download a repository with submodules, as if I
>> we using "*git clone --recursive*". The manual talks about
>> *LIBFOO_GIT_SUBMODULES
>> *when you set *LIBFOO_SITE_METHOD = git* but the manual doesn?t say
>> anything about what we are supposed to configure in this variable. Do we
>> have to write Y or YES? The fact is that it is not working and buildroot
>> does not give any advice.
> 
> You may set LIBFOO_GIT_SUBMODULES to any non-empty value to trigger a 
> recursive git clone.

True, but I think we should at least suggest "YES" in the manual, to
avoid people to have to guess, or to do guesswork and try "YES_PLEASE"
or a space separated list of modules.

I'm sending a patch do the manual.

-- 
Luca
