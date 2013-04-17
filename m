From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 17 Apr 2013 15:57:51 -0500
Subject: [Buildroot] [PATCH 1/1] fs: add uimage support w/ example for
	cpio
In-Reply-To: <6db2a76f-5b31-47b2-8b59-55414a827904@CO9EHSMHS008.ehs.local>
References: <1366225654-11562-1-git-send-email-spenser@gillilanding.com>
 <1366229731-13024-1-git-send-email-spenser@gillilanding.com>
 <CAEBucnD4XSCo9gUK9-Mn1+yYP2ayMfd7GDOGZH1j5w9KTreffA@mail.gmail.com>
 <6db2a76f-5b31-47b2-8b59-55414a827904@CO9EHSMHS008.ehs.local>
Message-ID: <CAEBucnBb9KdesZzdx_ZyEcRbTkd4-0=4etTfno4j1BP50Yms_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Soren,

Thanks for the tips.  I appreciate the tips. I'll be sure to use those
options in the future.

Spenser

On Wed, Apr 17, 2013 at 3:56 PM, S?ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:
> Hi Spenser,
>
> On Wed, Apr 17, 2013 at 03:19:40PM -0500, Spenser Gilliland wrote:
>> Soren,
>>
>> Yes, you were right.  The patch did not have the whitespace fixes.
>> Either git format-patch doesn't overwrite old patches or I used the
>> old ref when I rebased for the whitespace fix.  Still very new to git
>> send-email and format-patch.
> Okay, then as further tips:
> It is usually good practice to mark new revisions of a patch as such, by
> adding a 'v2' (for the second version) to the subject. Either by specifying
> '--subject-prefix' or on later git versions '--reroll-count' when running
> format-patch.
>
> And a changelog should be sent with the patch and usually goes after the
> line with the three dashes in the same email. The text after the '---'
> is not part of the commit message.
>
>         Regards,
>         S?ren
>
>



-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
