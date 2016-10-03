From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Mon, 3 Oct 2016 14:06:32 +0200
Subject: [Buildroot] [PATCH v3 2/2] couchdb: New package.
In-Reply-To: <l9i9cdxqle.ln2@ID-313208.user.individual.net>
References: <0dc17f18-b259-a618-67f3-099fd6ef0897@green-communications.fr>
 <1467800649-22119-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1467800649-22119-2-git-send-email-nicolas.cavallari@green-communications.fr>
 <l9i9cdxqle.ln2@ID-313208.user.individual.net>
Message-ID: <ae2578c0-0de1-7cd4-e595-cc88449d7615@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/2016 10:43, Bernd Kuhls wrote:
> Hi,
> 
> Am Wed, 06 Jul 2016 12:24:09 +0200 schrieb Nicolas Cavallari:
> 
>> +	select BR2_PACKAGE_ERLANG
> 
> the elrang version provided by buildroot is detected as incompatible with 
> couchdb 1.6.1:

Yes, the erlang version was bumped one month after posting my patch.

I remembered that patching the configure was enough for the thing to
build anyway, but I couldn't test it because the other program that
was using couchdb was utterly broken.

But still, with the previous patch revision, people were unsure of
whether my two patches were actually wanted, considering the uglyness
of spidermonkey185.

And, by the way, couchdb 2.0 is still not usable for distribution
packaging, let alone cross-compilation.
