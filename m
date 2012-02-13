From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Mon, 13 Feb 2012 21:40:57 +0200
Subject: [Buildroot] [PATCH 3/3] .gitignore: remove wrong entries
In-Reply-To: <201202121205.32861.arnout@mind.be>
References: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
 <CAAXf6LXsQCsdwswHGa=Ei-+DkB7OyJbKnz7MhatTeEgCk5MMWw@mail.gmail.com>
 <CAMP44s10qfDsyg69vHqsR-Lu3V9uJoJH6AY46xETJ=T-ijhxQA@mail.gmail.com>
 <201202121205.32861.arnout@mind.be>
Message-ID: <CAMP44s3KaL4F6fqrZKACTZEvH-hKT1AD3N-zGu5A9dpgSNJXhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 12, 2012 at 1:05 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Sunday 12 February 2012 00:01:51 Felipe Contreras wrote:
>> > I'm neutral on the .patch and .diff change, but I think that .depend, .o,
>> > .orig, .rej and ~ backups should remain in .gitignore.
>>
>> *.o and *.depend should be there, as they are the output of the build system.
>
> ?No they're not. ?Maybe in a far and distant past, but now (almost) all
> output is in the output directory.

Oh, in that case they should be removed then :)

-- 
Felipe Contreras
