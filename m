From: Paul Jones <paul.jones@iwtech.com.au>
Date: Tue, 06 Apr 2010 07:34:18 +1000
Subject: [Buildroot] QT embedded working with Xorg?
In-Reply-To: <4BBA28D4.2040702@carallon.com>
References: <4BB1EE15.6000505@browserseal.com>	<4BB1F87D.4050706@terawatt.fr>	<4BB1FA0F.5070703@carallon.com>	<4BB20147.50404@terawatt.fr>	<4BB4B0D7.4080002@carallon.com>	<4BB4B9F3.2010905@terawatt.fr>	<4BB5D9C3.1020209@terawatt.fr>
	<4BB9BC7C.4030404@iwtech.com.au> <4BBA28D4.2040702@carallon.com>
Message-ID: <4BBA575A.5060403@iwtech.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6/04/2010 4:15 AM, Will Wagner wrote:
> On 05/04/2010 11:33, Paul Jones wrote:
>> On 04/02/10 22:49, Damien Borie wrote:
>>> Hi,
>>>
>>> It's working fine! I only changed X11-commercial to X11-opensource and
>>> it's ok. I got problems with font or encoding but it will be cleared
>>> soon I think.
>>> Thank you, your patch was very useful.
>> What arch are you building for? I'm building for ARM and I'm getting
>> build errors.
>>
> If you are using the patch I submitted to the list without 
> modification then i don't think it will work. I had hard coded into 
> that patch that Qt was being built for x86 (also being built on x64 
> machine). The patch was not meant to be for the general case and would 
> need more work for that. If there is interest I will look at doing a 
> better patch for submission.
>
> Will
>

Ahh ok. I saw that i386 in there but I wasn't sure what it was for. I'll 
have a fiddle with it and see if I can get it to work.


Paul.
