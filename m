From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 20 Oct 2015 16:17:57 +0100
Subject: [Buildroot] [git commit] tstools: GitHub migration
In-Reply-To: <20151020171446.5db7b297@free-electrons.com>
References: <20151020143645.F3EB4818D4@busybox.osuosl.org>
 <20151020171446.5db7b297@free-electrons.com>
Message-ID: <56265B25.8070900@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 10/20/2015 04:14 PM, Thomas Petazzoni wrote:
> Peter, Vicente,
> 
> On Tue, 20 Oct 2015 16:33:07 +0200, Peter Korsgaard wrote:
> 
>> - Wrap the help text in the Config.in to 72 characters, and also change
>>   the project URL to the GitHub one.
> 
> Hhh...
> 
> 
>> -	  This is a set of cross-platform command line tools for
>> -	  working with MPEG data
>> +	  This is a set of cross-platform command line tools for working with
>> +	  MPEG data.
> 
> This clearly doesn't fit in 72 characters now, except if you count tab
> as one character of course. emacs says that the long line here is now
> 77 characters long.

Yes, I count the tab as 1 character. Shouldn't I?

For me, the tab is 1 character. Then you can set your text editor to
display the tabs as you want. You can display them as 1 space, 2, 3, 4...

Regards,

Vincent.

> So basically, the previous wrapping was more correct, IMO.
> 
> Thomas
> 
