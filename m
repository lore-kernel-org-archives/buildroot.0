From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 17 Jul 2017 06:18:54 -0500
Subject: [Buildroot] Autobuilder reporting old build issues
In-Reply-To: <20170716102002.6d570790@windsurf>
References: <20170715100105.108fb7ab@windsurf>
 <20170716102002.6d570790@windsurf>
Message-ID: <CANQCQpZtCQzSVZMgt=+qt7DEfMJE3WSPE4EWvM4iA+Rzt=Lh6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Jul 16, 2017 at 3:20 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Matt,
>
> On Sat, 15 Jul 2017 10:01:05 +0200, Thomas Petazzoni wrote:
>
>> Is there something special going on with your autobuilder setup?
>> Indeed, it very often reports build results that are based on Buildroot
>> versions that are a few days old, as if you're not testing the latest
>> Buildroot.
>>
>> For example, if you look at the attached screenshot, all autobuilder
>> instances reported results based on Buildroot 05827480 (the strace
>> commit I made yesterday evening), except your autobuilder results,
>> which were based on 704db158 (a commit made on July 10, i.e 4-5 days
>> ago).
>
> Since your autobuilder is still reporting build results that date back
> from commit 704db158, I've disabled your account so that build results
> from your autobuilder are no longer accepted.
>
> Let me know when the problem is fixed, so that I can re-enable your
> account.
>


Apologize for the delay, I was on vacation.

I had pointed the Buildroot git  remote at our internal mirror because
of network issues fetching (this could lead to a delay of ~12hrs or
longer if the mirrors can't fetch).  I'll take a look at the
autobuilder script and instead of pointing at the mirror, I'll improve
error handling of when the remote fails to fetch.  Once this is tested
out, I'll respond back.

Matt
