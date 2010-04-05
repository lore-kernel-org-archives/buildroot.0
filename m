From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 05 Apr 2010 19:15:48 +0100
Subject: [Buildroot] QT embedded working with Xorg?
In-Reply-To: <4BB9BC7C.4030404@iwtech.com.au>
References: <4BB1EE15.6000505@browserseal.com>	<4BB1F87D.4050706@terawatt.fr>	<4BB1FA0F.5070703@carallon.com>	<4BB20147.50404@terawatt.fr>	<4BB4B0D7.4080002@carallon.com>	<4BB4B9F3.2010905@terawatt.fr>	<4BB5D9C3.1020209@terawatt.fr>
	<4BB9BC7C.4030404@iwtech.com.au>
Message-ID: <4BBA28D4.2040702@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/04/2010 11:33, Paul Jones wrote:
> On 04/02/10 22:49, Damien Borie wrote:
>    
>> Hi,
>>
>> It's working fine! I only changed X11-commercial to X11-opensource and
>> it's ok. I got problems with font or encoding but it will be cleared
>> soon I think.
>> Thank you, your patch was very useful.
>>      
> What arch are you building for? I'm building for ARM and I'm getting
> build errors.
>
>    
If you are using the patch I submitted to the list without modification 
then i don't think it will work. I had hard coded into that patch that 
Qt was being built for x86 (also being built on x64 machine). The patch 
was not meant to be for the general case and would need more work for 
that. If there is interest I will look at doing a better patch for 
submission.

Will
