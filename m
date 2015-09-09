From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Sep 2015 10:10:47 +0100
Subject: [Buildroot] [PATCHv3] package/efl/libevas: remove unsafe paths
In-Reply-To: <55EFF712.3020701@openwide.fr>
References: <1441789273-1850-1-git-send-email-Vincent.Riera@imgtec.com>
 <55EFF712.3020701@openwide.fr>
Message-ID: <55EFF797.40005@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On 09/09/2015 10:08 AM, Romain Naour wrote:
> Hi Vicente,
> 
> Le 09/09/2015 11:01, Vicente Olivert Riera a ?crit :
>> Fixes:
>>
>>   http://autobuild.buildroot.net/results/7f2/7f2baef97c4ff3b9111becc1e0b79780c6e9db6f/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> I'll remove this package soon, so it's not useful to fix this error now ;-)
> http://patchwork.ozlabs.org/patch/515599/

yeah, I have seen your patch series, but this patch (which is easy to
review and test) will prevent future autobuild failures until your
series (which is more complex and therefore harder to review and test)
is merged.

Regards,

Vincent.

> Best regards,
> Romain
> 
