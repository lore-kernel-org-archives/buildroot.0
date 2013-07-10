From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Jul 2013 14:07:37 -0300
Subject: [Buildroot]
 =?windows-1252?q?Error_while_installing_dosfstools=3A?=
 =?windows-1252?q?_mkdosfs=92=3A_No_such_file_or_directory?=
In-Reply-To: <20130710185808.56c3ac52@skate>
References: <CAF3SDA4DY8DkDTVr5F4aLxmoJha60Y4DnZ9yC0u7PdhteR3Svg@mail.gmail.com>
 <87obaciyn8.fsf@dell.be.48ers.dk>
 <CAF3SDA7tGGeJfP2kJcf9Hy6Z4KrqUhHV0E1JBTE+0x+-bCMEMw@mail.gmail.com>
 <87bo6ci9xk.fsf@dell.be.48ers.dk> <51DD6469.4010504@gmail.com>
 <20130710185808.56c3ac52@skate>
Message-ID: <51DD94D9.6060001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/10/2013 01:58 PM, Thomas Petazzoni wrote:

> Dear Daniel Hilst Selli,
> 
> On Wed, 10 Jul 2013 13:40:57 +0000, Daniel Hilst Selli wrote:
> 
>> Here, this solves my problem.
>> http://pastebin.com/esGFdC0n
> 
> Can you send a proper patch with this fix?

How so?
There's something fishy with this "bug".
The tool renaming happened with dosfstools 3.0.18, hence 3.0.16 behaves
the exact same way as before (mkdosfs instead of mkfs.fat and so on).
Either the 3.0.16 tarball he has isn't really 3.0.16 or i don't know
what's up.
Daniel: did you try removing the source tarball and trying a new download?
Regards.
