From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Mar 2016 16:43:14 +0100
Subject: [Buildroot] [PATCH] tcl: rework logic for databases support
In-Reply-To: <20160330174149.5325020f@free-electrons.com>
References: <1459351282-16091-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160330173503.2e710605@free-electrons.com> <56FBF32C.7070802@imgtec.com>
 <20160330174149.5325020f@free-electrons.com>
Message-ID: <56FBF412.6020204@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 30/03/16 16:41, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 30 Mar 2016 16:39:24 +0100, Vicente Olivert Riera wrote:
> 
>> We remove sqlite unconditionally because we don't want to use the
>> bundled version.
> 
> Yes, explain this in a comment :)

Sure.

>> For tdbcodbc I don't have any particular reason to remove it or keep it.
>> What do you prefer?
> 
> If it was already removed before your patch, keep it this way.

It was, yes.

Thanks for the quick reply.

Regards,

Vincent.

> 
> Thanks!
> 
> Thomas
> 
