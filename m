From: Vornefeld, Bernhard <Bernhard.Vornefeld@mep.de>
Date: Mon, 5 Oct 2009 10:01:44 +0200
Subject: [Buildroot] Buildroot and version control systems
In-Reply-To: <87a5b0800910020614waeff4a1j7d5c79be04e75241@mail.gmail.com>
References: <38479127BA626E41B7397B72623101431B7122@mep-server-1.mep.de>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAANIfWqGxed5Gq+toirCYmVEBAAAAAA==@cimeq.qc.ca>
	<87a5b0800910020604r7f1ace15o55d56c3d824261a@mail.gmail.com>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAGmhhQKukS5CuVw3jfWJFzEBAAAAAA==@cimeq.qc.ca>
	<87a5b0800910020614waeff4a1j7d5c79be04e75241@mail.gmail.com>
Message-ID: <38479127BA626E41B7397B72623101431B7124@mep-server-1.mep.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My request was rather basic: Which parts of the "used" (make etc.) buildroot subfolder structure can be versioned?
Which files and folders have to be ignored doing check ins?
Does it make sense to use the complete toolchain as working copy? 
Vendor branches are not in our scope now.

Regards, 
Bernhard

MEP Kutsch GmbH & Co. KG 
Fla?kuhle 1 
58452 Witten 
Tel.:  02302 28262-36 
Fax.: 02302 28262-99 

mailto:bernhard.vornefeld at mep.de 

http://www.mep.de 


-----Urspr?ngliche Nachricht-----
Von: Will Newton [mailto:will.newton at gmail.com] 
Gesendet: Freitag, 2. Oktober 2009 15:14
An: Jonathan dumaresq
Cc: Vornefeld, Bernhard; buildroot at busybox.net
Betreff: Re: [Buildroot] Buildroot and version control systems

On Fri, Oct 2, 2009 at 2:10 PM, Jonathan dumaresq <jdumaresq@cimeq.qc.ca> wrote:
> Hi Will,
>
>
> I think this is how most people use buildroot - taking the upstream 
> version and making local modifications. It should be fairly 
> straightforward to do this in any version control system using e.g. in 
> CVS a vendor branch, or in git having two branches, one to track 
> upstream and one for your changes.
>
> We are using svn as source version control.

Subversion has some notion of vendor branches, e.g.:

http://svnbook.red-bean.com/en/1.1/ch07s05.html

But I am not an svn expert so I can't really help with the details.
