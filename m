From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Dec 2015 16:04:20 +0000
Subject: [Buildroot] [PATCH] gob2: add a hash file
In-Reply-To: <566850AF.4020602@imgtec.com>
References: <1449675697-34390-1-git-send-email-Vincent.Riera@imgtec.com>
 <56684F62.1020205@zacarias.com.ar> <566850AF.4020602@imgtec.com>
Message-ID: <56685104.4000709@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again Gustavo,

isn't this the official site?

http://www.jirka.org/gob.html

Regards,

Vincent.

On 09/12/15 16:02, Vicente Olivert Riera wrote:
> Hi Gustavo,
> 
> On 09/12/15 15:57, Gustavo Zacarias wrote:
>> On 09/12/15 12:41, Vicente Olivert Riera wrote:
>>
>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>> ---
>>>   package/gob2/gob2.hash | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>   create mode 100644 package/gob2/gob2.hash
>>>
>>> diff --git a/package/gob2/gob2.hash b/package/gob2/gob2.hash
>>> new file mode 100644
>>> index 0000000..3678bdd
>>> --- /dev/null
>>> +++ b/package/gob2/gob2.hash
>>> @@ -0,0 +1,2 @@
>>> +# Locally calculated
>>> +sha256
>>> f7ee84c07ca88ae96e5a60461957cc4dd0aa69d61804433d1c85de3d50be8026 
>>> gob2-2.0.20.tar.xz
>>
>> Hi Vicente.
>> Why not
>> http://ftp.acc.umu.se/pub/gnome/sources/gob2/2.0/gob2-2.0.20.sha256sum ?
>> Regards.
>> That's the official upstream and there's a mismatch, oops.
> 
> Well, we currently download this tool from here:
> 
> http://ftp.5z.com/pub/gob/
> 
> And the tarball downloaded from there has the hash value I wrote in my
> .hash file.
> 
> If you say that's the official upstream, then the .mk file needs to be
> updated as well.
> 
> Regards,
> 
> Vincent.
> 
>> Regards.
