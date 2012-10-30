From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 30 Oct 2012 11:25:01 +0000
Subject: [Buildroot] [PATCH] gqview: Fix build failure due to missing -lm
In-Reply-To: <508A3DD8.8060009@mind.be>
References: <1349555736-10008-1-git-send-email-gvaxon@gmail.com>
 <508A3DD8.8060009@mind.be>
Message-ID: <CAG2jQ8js-jqe2QYKVgehCeQL1iy8vsEDGV4OEo3NT=JS=akJ6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 26, 2012 at 8:38 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 06/10/12 22:35, Valentine Barshak wrote:
>>
>> Signed-off-by: Valentine Barshak<gvaxon@gmail.com>
>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  Problem can be reproduced on e.g. x86_64 with external toolchain.
>
>  And since upstream is dead, the simple addition of -lm to LIBS is an
> adequate solution.
>
>  Regards,
>  Arnout
>
>

Works for me as well.

Tested-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
Regards,
Markos
