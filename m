From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Jan 2014 08:57:36 +0100
Subject: [Buildroot] [PATCH] gdb: move version selection from gdb.mk to
	Config.in.host
In-Reply-To: <CAEBucnBK9_LfVm6AHzvHcub31mew-OXk04L7XW4KeZcCBq3h8w@mail.gmail.com>
References: <52E9752E.2020602@mind.be>	<1391031881-19546-1-git-send-email-arnout@mind.be>
 <CAEBucnBK9_LfVm6AHzvHcub31mew-OXk04L7XW4KeZcCBq3h8w@mail.gmail.com>
Message-ID: <52EA05F0.6090202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/01/14 02:29, Spenser Gilliland wrote:
> Arnout,
>
>> This avoids duplication of the version selection between these two files.
>>
>> Cc: Spenser Gilliland <spenser@gillilanding.com>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> Warning: I have not really tested this!
[snip]
>
> This seems like a much better approach.  I'll run it through some
> tests and get back to you.
>
> Spenser

  Can you take it over and include it in your series? And test it, of 
course :-)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
