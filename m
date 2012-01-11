From: Jigar SOLANKI <jigar.solanki@labri.fr>
Date: Wed, 11 Jan 2012 16:38:57 +0100
Subject: [Buildroot] Cant type anything into Serial Console login
In-Reply-To: <4F0DAC50.7080602@labri.fr>
References: <4F0D76AB.7000508@labri.fr> <8739bmbb3o.fsf@macbook.be.48ers.dk>
 <4F0D9B42.2070604@labri.fr> <87y5te9uxy.fsf@macbook.be.48ers.dk>
 <4F0D9D1E.7090406@labri.fr> <87lipe9sku.fsf@macbook.be.48ers.dk>
 <4F0DA91F.3000403@labri.fr> <87hb029s3c.fsf@macbook.be.48ers.dk>
 <4F0DAC50.7080602@labri.fr>
Message-ID: <4F0DAD11.8040403@labri.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 11/01/2012 16:35, Jigar SOLANKI a ?crit :
> Le 11/01/2012 16:28, Peter Korsgaard a ?crit :
>>>>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:
>>
>>  >> That doesn't seem to match your first mail:
>>  >> 
>>  >> # Put a getty on the serial port
>>  >> ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
>>  >> 
>>
>>  Jigar> Yep, sorry, I was just testing every ttySx at random. The command line
>>  Jigar> indeed was with ttyS0 of course, everything in kernel command/serial
>>  Jigar> console client/inittab/security is coherent with the ttySx I choose.
>>
>>  Jigar> Same result with both.
>>
>> What do you mean with 'same result'? From your first mail you mentioned
>> you got 'Welcome to Buildroot' and a Login prompt. If you boot with
>> init=/bin/sh you shouldn't get any of that.
>>
>> I notice you don't provide any root=. What kind of file system are you
>> trying to boot?

Initramfs

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 554 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120111/993176f4/attachment.asc>
