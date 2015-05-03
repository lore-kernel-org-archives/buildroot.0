From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 03 May 2015 18:59:45 +0200
Subject: [Buildroot] [PATCH 1/2] package/libpthsem: remove
 argp-standalone dependency
In-Reply-To: <5544C15E.9060103@mind.be>
References: <1430562486-23625-1-git-send-email-romain.naour@openwide.fr>
 <5544C15E.9060103@mind.be>
Message-ID: <55465401.4080207@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All

Le 02/05/2015 14:21, Arnout Vandecappelle a ?crit :
> On 02/05/15 12:28, Romain Naour wrote:
>> argp-standalone provide libargp.a and argp.h which are
>> never used in libpthsem.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  Build-test with and without the _COMPAT option, and checked that there is no
> reference to argp in the source.
> 
>  Adding the original submitter of this package in Cc for final verification.
> Gregory, do you remember why you added the argp-standalone dependency?
> 
Peter find why argp-standalone was added to libpthsem:
http://git.buildroot.net/buildroot/commit/?id=25206d6e26dc4ce9c272e68876f31d0ca7d30e67

Gregory is also the original submitter of bcusdk package and it seems that he
added argp-standalone dependency to libpthsem instead of bcusdk.

Thank you Arnout for your review and test.

Best regards,
Romain

>  Regards,
>  Arnout
> 
