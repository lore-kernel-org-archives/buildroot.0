From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 3 Dec 2015 10:35:01 +0000
Subject: [Buildroot] [PATCH 1/4] dhrystone: add a hash file
In-Reply-To: <87poyofulj.fsf@dell.be.48ers.dk>
References: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
 <87poyofulj.fsf@dell.be.48ers.dk>
Message-ID: <56601AD5.1090608@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 02/12/15 20:45, Peter Korsgaard wrote:
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

isn't the purpose of the hash files to ensure that we download exactly
what we want to download, so we can make the builds reproducible?

If that file changes, we will notice it thanks to its hash file. You
could ask the same for tarballs. What are we going to do if this
tarballs ever changes?

Regards,

Vincent.
