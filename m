From: Daniel Mack <zonque@gmail.com>
Date: Mon, 05 Dec 2011 20:32:34 +0100
Subject: [Buildroot] [PATCH v2] Add package connman
In-Reply-To: <20111205202028.75432ef3@skate>
References: <20111205130056.GB30001@sapphire.tkos.co.il>
 <1323090955-5661-1-git-send-email-zonque@gmail.com>
 <87obvnrsnv.fsf@macbook.be.48ers.dk> <4EDCFEB2.60603@gmail.com>
 <20111205202028.75432ef3@skate>
Message-ID: <4EDD1C52.1050907@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 12/05/2011 08:20 PM, Thomas Petazzoni wrote:
> Le Mon, 05 Dec 2011 18:26:10 +0100,
> Daniel Mack <zonque@gmail.com> a ?crit :
> 
>> I'm cloning from a git repository, for the reason described in the
>> commit log. Hence, the configure script has to be generated.
> 
> Could you add a comment above the _AUTORECONF=YES line mentioning this
> reason ?

Really? The commit log already states the fact and the reason for the
git checkout, and AFAIK, all packages that are pulled from upstream
repositories have to have _AUTORECONF=YES, don't they?

I can do that, I'm just wondering if that one comment line is worth
another version :)


Daniel
