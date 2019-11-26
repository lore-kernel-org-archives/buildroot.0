From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Nov 2019 23:47:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/fis: add an upstream URL to
 Config.in
In-Reply-To: <87eexus6wv.fsf@dell.be.48ers.dk>
References: <20191126144341.27186-1-mark@dibsco.co.uk>
 <20191126210534.168608da@windsurf> <87eexus6wv.fsf@dell.be.48ers.dk>
Message-ID: <e4806204-2ff9-a6f6-7034-bde0aa329cd4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/11/2019 21:45, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> 
> Hi,
> 
>  > Just pointing to the source code itself is not that useful. Do we
>  > really need to keep this package? It seems like some completely
>  > outdated stuff. Who uses Redboot partition tables these days ?
> 
>  > In fact, maybe fconfig could also be dropped, it's Redboot related as
>  > well.
> 
>  > Arnout, Peter, what do you think?
> 
> I would personally not mind getting rid of them. It is probably getting
> close to 15 years since I last used Redboot.

 If we're going to remove packages, now is an excellent time to do it: people
have three months to complain about it.

 Regards,
 Arnout
