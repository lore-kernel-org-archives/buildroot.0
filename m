From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 05 Dec 2013 21:44:11 +0100
Subject: [Buildroot] [PATCH 03/16] packages: convert Github http://
	users to	the github helper
In-Reply-To: <20131205201918.77052a05@skate>
References: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386264059-14057-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <768537dc-810e-4cbf-9385-69f4d9ea05b4@email.android.com>
 <20131205201918.77052a05@skate>
Message-ID: <f6b5ce91-aa4f-4bb7-a9ee-32c94b755eee@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>Dear Thomas De Schampheleire,
>
>On Thu, 05 Dec 2013 20:14:56 +0100, Thomas De Schampheleire wrote:
>
>> Thomas, did you see my comments on Mischa's v3 earlier today?
>
>Hu, did you really read this new patch series? I've split the patch into
>3 patches as you requested, and I've moved the macro to
>pkg-download.mk, as you requested.
>
>>  Do you plan to make these changes, do you expect Mischa or someone else to do them? 
>
>See above.
>
>> Do you consider it more to be a follow-up patch?
>
>See the cover letter for the patch series:
>
>"""
>According to Thomas DS comment, I've split Mischa's patch adding the
>github helper into three patches: one adding the helper, one adding
>the documentation, one converting a bunch of packages to the new
>helper. Note that not all packages are converted, but this can be done
>through followup commits: we really want this ARC and Microblaze stuff
>to get merged now.
>"""

Hmm, for some reason I did not have the cover letter in
my k9 client, surely there's a glitch in it. 
I did see the rest of the series though, and the fact that
you split up the patch. I should have been more clear
that I was mostly missing some patches to be converted. 
But that is now clarified in the comment above.
I'll provide acks tomorrow...

Best regards,
Thomas
