From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Mon, 23 Sep 2013 09:36:56 +0200
Subject: [Buildroot] [PATCH] Add lesstif package
In-Reply-To: <20130922154155.09a7fa50@skate>
References: <523A9EE2.9050701@wanadoo.fr> <87zjr59rgu.fsf@dell.be.48ers.dk>
 <20130922154155.09a7fa50@skate>
Message-ID: <523FEF98.10707@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 22/09/2013 15:41, Thomas Petazzoni a ?crit :
> Peter, Thierry,
>
> On Sun, 22 Sep 2013 10:43:29 +0200, Peter Korsgaard wrote:
>
>>  Thierry>  	menu "X11R7 Libraries"
>>  Thierry> +		source package/x11r7/lesstif/Config.in
> I am also unsure it should be under package/x11r7/. What we normally
> keep under package/x11r7/ is really the X.org stack itself, which comes
> from the X.org project. 
I agree with that.

Shall I put it in the  "Graphics" menu (inserting it with the
alphabetical order)
or in "Graphics  libraries and applications (graphic/text) / graphic
libraries" ?

Thierry
> As I understand it, Lesstif is more a toolkit
> such as Gtk/Qt/EFL, so it should probably be packaged directly in
> package/.
>
> Thomas
