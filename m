From: Vincent Fazio <vfazio@xes-inc.com>
Date: Wed, 5 Feb 2020 10:31:26 -0600
Subject: [Buildroot] [PATCH v2 1/6] package/go: implement go modules
 integration
In-Reply-To: <CA+h8R2ogHk+7U=oWEq09wxQqEfvf-Owrm1uZiVf_ZjrxuEeq4Q@mail.gmail.com>
References: <20200111041355.21705-1-christian@paral.in>
 <18bb82ad-f3fd-d360-ee60-b3d1c4743057@xes-inc.com>
 <CA+h8R2ogHk+7U=oWEq09wxQqEfvf-Owrm1uZiVf_ZjrxuEeq4Q@mail.gmail.com>
Message-ID: <f46720fe-ee30-912c-73ce-5d632b59b8fa@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chrisitan,

On 2/4/20 5:22 PM, Christian Stewart wrote:
> Hi Vincent,
>
> Apologies for the delay on this-
No problem, we all get busy.
> On Tue, Jan 14, 2020 at 8:56 AM Vincent Fazio <vfazio@xes-inc.com> wrote:
>> I tested this with a HOST Go package that i've got for git-lfs that I
>> haven't submitted yet and it needed a couple of tweaks.
>>
>> lmk your thoughts
> Unfortunately the format you've sent your corrections is a bit
> confusing for me, and I'd like to make sure I get it right. Do you
> have a copy of the .patch anywhere with your adjustments?

Sorry about that. Please take a look at the commit history here: 
https://gitlab.com/vfazio/buildroot/-/commits/go-modules-fixups

Some of the changes aren't directly tied to your work, but help make 
HOST and TARGET golang builds a bit easier to maintain (IMO).

Hopefully that helps.

> Best regards,
> Christian

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
