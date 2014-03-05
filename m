From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Mar 2014 18:26:47 +0100
Subject: [Buildroot] [PATCH 6 of 8] manual: contributing: minor
 rewording of 'submitting patches' section
In-Reply-To: <e71bbcb3a276227ed93f.1394036672@argentina>
References: <patchbomb.1394036666@argentina>
 <e71bbcb3a276227ed93f.1394036672@argentina>
Message-ID: <20140305172647.GF5066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Not directly related to your patch...

On 2014-03-05 17:24 +0100, Thomas De Schampheleire spake thusly:
> @@ -236,7 +238,7 @@ Hereafter the recommended layout:
>  ---------------
>  Patch title less than 80-character length
>  
> -Some more paragraph giving some more details.
> +A paragraph giving more details.
>  
>  And yet another paragraph giving more details.

I like it when commit log are describing what the problem is, what the
reason is, and how it is solved. Something like:

    Patch title: short explanation, less than 80 chars

    A paragraph that explains the problem, and how
    it manifests itself. If the problem is complex,
    it is OK to add more paragraph.

    A paragraph that explains the root cause of the problem.
    Again, more than on paragraph is OK.

    Finally, a paragraph than explains how it is solved.
    
    Signed-off-by: John DOE <john.doe@example.net>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
