From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 May 2014 21:52:32 +0200
Subject: [Buildroot] Problems building for Olimex A13. A new user
 enquires ...
In-Reply-To: <20140519084302.1a0259f3@free-electrons.com>
References: <09d801cf72fa$f6cc2c40$e46484c0$@novadsp.com>
 <20140519084302.1a0259f3@free-electrons.com>
Message-ID: <537BB280.3030701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/05/14 08:43, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 19 May 2014 01:40:42 +0100, g4 at novadsp.com wrote:
> 
>> --------------------------snip------------------------------
>> make[1]: Leaving directory `/home/jevans/olimex/buildroot'
>>>>> uboot  Downloading
> 
> There is no U-Boot version specified. I'd say your Buildroot
> configuration might be wrong.

 So we should probably check for that...

 Patch follows.

 Regards,
 Arnout

> 
>> Doing shallow clone
>> Cloning into 'uboot-'...
>> warning: Could not find remote branch --bare to clone.
>> fatal: Remote branch --bare not found in upstream origin
>> Unexpected end of command stream
>> Doing full clone
>> Cloning into bare repository 'uboot-'...
>> remote: Reusing existing pack: 261244, done.
>> remote: Counting objects: 52, done.
>> remote: Compressing objects: 100% (52/52), done.
>> remote: Total 261296 (delta 29), reused 2 (delta 0)
>> Receiving objects: 100% (261296/261296), 72.68 MiB | 228.00 KiB/s, done.
>> Resolving deltas: 100% (205455/205455), done.
>> Checking connectivity... done.
>> usage: git archive [options] <tree-ish> [<path>...]
> 
> Which /might/ explain why git archive is failing (but not sure).
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
