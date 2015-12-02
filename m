From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Dec 2015 22:58:00 +0100
Subject: [Buildroot] [PATCH 1/4] dhrystone: add a hash file
In-Reply-To: <87poyofulj.fsf@dell.be.48ers.dk>
References: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
 <87poyofulj.fsf@dell.be.48ers.dk>
Message-ID: <565F6968.7090403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-12-15 21:45, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  > ---
>  >  package/dhrystone/dhrystone.hash | 2 ++
>  >  1 file changed, 2 insertions(+)
>  >  create mode 100644 package/dhrystone/dhrystone.hash
> 
>  > diff --git a/package/dhrystone/dhrystone.hash b/package/dhrystone/dhrystone.hash
>  > new file mode 100644
>  > index 0000000..9ea22a3
>  > --- /dev/null
>  > +++ b/package/dhrystone/dhrystone.hash
>  > @@ -0,0 +1,2 @@
>  > +# Locally calculated
>  > +sha256 038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e  dhry-c
> 
> Hmm, what are we going to do if this file ever changes?
> 

 Isn't that the whole point of the hash, that we notice when it changes?

 That said, I'm not sure what we can do about it when that happens, except
switch to a more reliable mirror.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
